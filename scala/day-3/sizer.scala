import scala.io._
import scala.actors._
import Actor._
import scala.xml.XML
import scala.xml.parsing.NoBindingFactoryAdapter
import org.xml.sax.InputSource
import org.ccil.cowan.tagsoup.jaxp.SAXFactoryImpl

object PageLoader {
  def getPageStats(url : String) = {
    val contentAsString = loadPageAsString(url)
    val contentAsXml = loadPageAsXml(url)
    
    (contentAsString.length,
      (contentAsXml \\ "a").toList.length)
  }

  private def loadPageAsXml(url: String) = {
    val parser = (new SAXFactoryImpl).newSAXParser()
    val source = new InputSource(url)
    val adapter = new NoBindingFactoryAdapter
    adapter.loadXML(source, parser)
  }
  
  private def loadPageAsString(url: String) = {
    Source.fromURL(url).mkString
  }
}

val urls = List("http://www.amazon.com/", 
               "http://www.twitter.com/",
               "http://www.google.com/",
               "http://www.cnn.com/" )

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def printPageStats(url: String, size: Number, links: Number) = {
  println("Stats for " + url + ":")
  println("  size  = "  + size)
  println("  links = " + links)  
}

def getPageSizeSequentially() = {
  for(url <- urls) {
    val (size, links) = PageLoader.getPageStats(url)
    printPageStats(url, size, links)
  }
}

def getPageSizeConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getPageStats(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url:String, (size:Number, links:Number)) => {
        printPageStats(url, size, links)
      }
    }
  }
}

println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }

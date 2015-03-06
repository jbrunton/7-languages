import scala.io.Source

trait Censor {
  val words = loadWords("words.txt")

  def censor(text: String): String = {
    (text /: words) {
      (str, word) => str.replaceAll(word._1, word._2)
    }
  }
  
  private def loadWords(filename: String) = {
    val rule = """\"(.*)\"\s*->\s*\"(.*)\"""".r
    Source.fromFile(filename).getLines().map {
      line => {
        line match {
          case rule(w1, w2) => (w1, w2)
          case _ => throw new Exception("Invalid syntax.")
        }
      }
    }.toMap
  }
}

class Pope extends Object with Censor

var text = "Shoot and Darn"
println(new Pope().censor(text))

trait Censor {
  val words = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

  def censor(text: String): String = {
    (text /: words) {
      (str, word) => str.replaceAll(word._1, word._2)
    }
  }
}

class Pope extends Object with Censor

var text = "Shoot and Darn"
println(new Pope().censor(text))

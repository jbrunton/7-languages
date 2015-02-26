object Cell {
  val VALID_VALUES = Set("X", "O", " ")
}

class Cell(val value: String) {
  if (!Cell.VALID_VALUES(value)) {
    throw new Exception("Invalid cell value: " + value)
  }
}

object Line {
  val CELL_COUNT = 3;
}

class Line(val cells: List[Cell]) {
  if (cells.length != Line.CELL_COUNT) {
    throw new Exception("Invalid line length: " + cells.length)
  }
  
  def isWinner(player: String): Boolean = {
    cells.forall(cell => cell.value == player)
  }
}

object Board {
  val ROW_COUNT = 3;
}

class Board(val rows: List[Line]) {
  if (rows.length != Board.ROW_COUNT) {
    throw new Exception("Invalid board size: " + rows.length)
  }
  
  def columns: List[Line] = {
    List(0,1,2).map(k => {
      new Line(rows.map(row => row.cells(k)))
    })
  }
  
  def diagonals: List[Line] = {
    List(
      new Line(List(rows(0).cells(0), rows(1).cells(1), rows(2).cells(2))),
      new Line(List(rows(0).cells(2), rows(1).cells(1), rows(2).cells(0)))
    )
  }
  
  def isWinner(player: String): Boolean = {
    val lines = rows ++ columns ++ diagonals
    lines.exists(line => line.isWinner(player))
  }
}

val board = new Board(
  List(
    new Line(List(new Cell(" "), new Cell("O"), new Cell("X"))),
    new Line(List(new Cell("O"), new Cell("X"), new Cell("O"))),
    new Line(List(new Cell("X"), new Cell("O"), new Cell("X")))
  )
)

println(board.isWinner("X"))
println(board.isWinner("O"))

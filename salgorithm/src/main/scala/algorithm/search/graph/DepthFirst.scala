package algorithm.search.graph

import scala.annotation.tailrec

object DepthFirst extends Search {

  override def search(field: Field, start: Vertex, goal: Vertex): Route = _search(field, start, goal, List.empty)

  @tailrec
  private def _search(field: Field, curr: Vertex, goal: Vertex, acc: Route): Route =
    curr match {
      case _ if curr == goal => (curr :: acc).reverse
      case _ if field.isEmpty || acc.isEmpty && (isDeadEnd(field, curr) || isCleared(curr, acc)) => NOT_FOUND
      case _ if isDeadEnd(field, curr) || isCleared(curr, acc) => _search(field, acc.head, goal, acc.tail) // backtrack
      case _ => field.get(curr) match {
        case Some(f) if f.isEmpty && acc.isEmpty => NOT_FOUND
        case Some(f) if f.isEmpty => _search(field, acc.head, goal, acc.tail)
        case Some(f) => _search(field.updated(curr, f.tail), f.head, goal, curr :: acc) // backtrack
        case _ if acc.isEmpty => NOT_FOUND
        case _ => _search(field, acc.head, goal, acc.tail)
      }
  }

}

package algorithm.search.graph

trait Search {

  type Field = Map[Vertex, List[Vertex]]
  type Route = List[Vertex]

  final val NOT_FOUND = List.empty

  def search(field: Field, start: Vertex, goal: Vertex): Route

  def nexts(field: Field, from: Vertex): List[Vertex] = field.getOrElse(from, List.empty)

  def isDeadEnd(field: Field, curr: Vertex): Boolean = field.get(curr).isEmpty

  def isCleared(curr: Vertex, acc: Route): Boolean = acc.exists(_ == curr)

}

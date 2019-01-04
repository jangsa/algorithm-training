package algorithm.search.graph

sealed trait Vertex
case object Start extends Vertex
case object Goal extends Vertex
case class MiscVertex[A](tag: A) extends Vertex


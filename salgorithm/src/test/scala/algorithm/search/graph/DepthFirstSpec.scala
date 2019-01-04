package algorithm.search.graph

import org.scalatest.FlatSpec

class DepthFirstSpec extends FlatSpec {

  "Search in empty field" should "returns empty route" in {
    assert(DepthFirst.search(Map.empty, Start, Goal) == List.empty)
  }

  "Search in singleton Start, Goal edge" should "returns Start -> Goal route" in {
    assert(DepthFirst.search(Map(Start -> List(Goal)), Start, Goal) == List(Start, Goal))
  }

  "Search in no goal field" should "returns empty route" in {
    assert(DepthFirst.search(Map(Start -> List.empty), Start, Goal) == List.empty)
    assert(DepthFirst.search(Map(Start -> List(MiscVertex(1))), Start, Goal) == List.empty)
  }

  "Search in no start field" should "returns empty route" in {
    assert(DepthFirst.search(Map(MiscVertex(1) -> List(Goal)), Start, Goal) == List.empty)
  }

  "Search in cyclic graph" should "returns empty route" in {
    val cyclicMaze: Map[Vertex, List[Vertex]] = Map(
      Start -> List(MiscVertex(1), MiscVertex(6), MiscVertex(8)),
      MiscVertex(1) -> List(Start, MiscVertex(2), MiscVertex(3)),
      MiscVertex(2) -> List(MiscVertex(1), MiscVertex(10), MiscVertex(11)),
      MiscVertex(3) -> List(MiscVertex(1), MiscVertex(4), MiscVertex(12)),
      MiscVertex(4) -> List(MiscVertex(3), MiscVertex(5), MiscVertex(13)),
      MiscVertex(5) -> List(MiscVertex(4), MiscVertex(6), MiscVertex(9)),
      MiscVertex(6) -> List(Start, MiscVertex(5), MiscVertex(7)),
      MiscVertex(7) -> List(MiscVertex(6), MiscVertex(8), MiscVertex(9)),
      MiscVertex(8) -> List(Start, MiscVertex(7), MiscVertex(14)),
      MiscVertex(9) -> List(MiscVertex(5), MiscVertex(7), Goal),
      MiscVertex(10) -> List(MiscVertex(2)),
      MiscVertex(11) -> List(MiscVertex(2)),
      MiscVertex(12) -> List(MiscVertex(3)),
      MiscVertex(13) -> List(MiscVertex(4)),
      MiscVertex(14) -> List(MiscVertex(8))
    )

    assert(
      DepthFirst.search(cyclicMaze, Start, Goal) == List(Start, MiscVertex(1), MiscVertex(3), MiscVertex(4), MiscVertex(5), MiscVertex(6), MiscVertex(7), MiscVertex(9), Goal)
    )
  }

}

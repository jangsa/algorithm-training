use crate::algorithm::search::graph::depth_first;
use crate::algorithm::search::graph::structure::Vertex::{Goal, Start, Vertex as Vertice};
use crate::algorithm::search::graph::structure::*;

#[test]
fn start_to_goal_test() -> Result<(), Vec<Vertex<i32>>> {
    println!("here is inside of start_to_goal_test!!!!!");
    let result = depth_first::search(maze_00(), &Start, &Goal);

    println!("{:?}", result);

    if result == vec![Start, Goal] {
        Ok(())
    } else {
        Err(result)
    }
}

#[test]
fn ordered_maze_test() -> Result<(), Vec<Vertex<i32>>> {
    let result = depth_first::search(maze_01(), &Start, &Goal);

    println!("{:?}", result);

    if result
        == vec![
            Start,
            Vertice(8),
            Vertice(14),
            Vertice(8),
            Vertice(7),
            Vertice(9),
            Goal,
        ]
    {
        Ok(())
    } else {
        Err(result)
    }
}

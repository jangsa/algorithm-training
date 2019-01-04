use algorithm::search::graph::depth_first;
use algorithm::search::graph::structure::Vertex::{Goal, Start};
use algorithm::search::graph::structure::*;

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
fn ordered_maze_test() -> Result<(), String> {
    Ok(())
}

use std::collections::HashMap;

use algorithm::search::graph::structure::Vertex::*;

#[derive(Debug, PartialEq, Eq, Hash, Copy, Clone)]
pub enum Vertex<A> {
    Start,
    Goal,
    Vertex(A),
}

pub fn maze_00() -> HashMap<Vertex<i32>, Vec<Vertex<i32>>> {
    let mut maze: HashMap<Vertex<i32>, Vec<Vertex<i32>>> = HashMap::new();

    maze.insert(Start, vec![Goal]);
    maze
}

pub fn maze_01() -> HashMap<Vertex<i32>, Vec<Vertex<i32>>> {
    let mut maze = HashMap::new();

    maze.insert(Start, vec![Vertex(1), Vertex(6), Vertex(8)]);
    maze.insert(Vertex(1), vec![Start, Vertex(2), Vertex(3)]);
    maze.insert(Vertex(2), vec![Vertex(1), Vertex(10), Vertex(11)]);
    maze.insert(Vertex(3), vec![Vertex(1), Vertex(4), Vertex(12)]);
    maze.insert(Vertex(4), vec![Vertex(3), Vertex(5), Vertex(13)]);
    maze.insert(Vertex(5), vec![Vertex(4), Vertex(6), Vertex(9)]);
    maze.insert(Vertex(6), vec![Start, Vertex(5), Vertex(7)]);
    maze.insert(Vertex(7), vec![Vertex(6), Vertex(8), Vertex(9)]);
    maze.insert(Vertex(8), vec![Start, Vertex(7), Vertex(14)]);
    maze.insert(Vertex(9), vec![Vertex(5), Vertex(7), Goal]);
    maze.insert(Vertex(10), vec![Vertex(2)]);
    maze.insert(Vertex(11), vec![Vertex(2)]);
    maze.insert(Vertex(12), vec![Vertex(3)]);
    maze.insert(Vertex(13), vec![Vertex(4)]);
    maze.insert(Vertex(14), vec![Vertex(8)]);

    maze
}

pub fn maze_02() -> HashMap<Vertex<i32>, Vec<Vertex<i32>>> {
    let mut maze: HashMap<Vertex<i32>, Vec<Vertex<i32>>> = HashMap::new();

    //maze.insert(Start, vec![Goal]);
    maze.insert(Start, vec![Vertex(1)]);

    maze
}

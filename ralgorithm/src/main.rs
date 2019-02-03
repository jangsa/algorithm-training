mod algorithm;

use crate::algorithm::search::graph::depth_first::*;
use crate::algorithm::search::graph::structure::Vertex::{Goal, Start};
use crate::algorithm::search::graph::structure::*;

fn main() {
    search(maze_01(), &Start, &Goal);
}

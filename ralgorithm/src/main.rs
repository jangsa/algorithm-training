mod algorithm;

use algorithm::search::graph::depth_first::*;
use algorithm::search::graph::structure::Vertex::{Goal, Start};
use algorithm::search::graph::structure::*;

fn main() {
    search(maze_01(), &Start, &Goal);
}

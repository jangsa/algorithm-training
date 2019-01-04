use algorithm::search::graph::structure::Vertex;
use std::collections::HashMap;

pub fn search(
    field: HashMap<Vertex<i32>, Vec<Vertex<i32>>>,
    start: &Vertex<i32>,
    goal: &Vertex<i32>,
) -> Vec<Vertex<i32>> {
    _search(start, vec![], field, goal)
}

pub fn _search(
    curr: &Vertex<i32>,
    mut acc: Vec<Vertex<i32>>,
    mut field: HashMap<Vertex<i32>, Vec<Vertex<i32>>>,
    goal: &Vertex<i32>,
) -> Vec<Vertex<i32>> {
    let result: Vec<Vertex<i32>> = match field.get_mut(&curr) {
        // when reached goal
        _ if *curr == *goal => {
            acc.push(*curr);
            acc
        }

        Some(ns) => {
            if let Some(next) = ns.pop() {
                acc.push(*curr);
                println!("-----> {:?}", ns);
                // _search(&next, acc, field, goal) // to be fixed
                _search(&next, acc, HashMap::new(), goal) // to be fixed
            } else if let Some(prev) = acc.pop() {
                // _search(&prev, acc, field, goal) // to be fixed
                _search(&prev, acc, HashMap::new(), goal) // to be fixed
            } else {
                vec![]
            }
        }

        // when vertex not found in the field AND backtrackable
        None if acc.len() > 0 => panic!("No Target Vertex Found."),

        // when not found
        _ => vec![],
    };

    result
}

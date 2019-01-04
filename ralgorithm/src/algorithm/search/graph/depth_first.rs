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

        // when vertices found
        Some(ns) => {
            if let Some(next) = ns.pop() {
                acc.push(*curr);
                println!("-----> acc: {:?}, ns: {:?}", acc, ns);
                // _search(&next, acc, field, goal) // to be fixed
                _search(&next, acc, HashMap::new(), goal) // to be fixed
            } else if let Some(prev) = acc.pop() {
                // _search(&prev, acc, field, goal) // to be fixed
                _search(&prev, acc, HashMap::new(), goal) // to be fixed
            } else {
                vec![]
            }
        }

        // when vertice not found
        None => vec![],
    };

    result
}

// if *curr == *goal {
//     // when reached goal
//     acc.push(*curr);
//     return acc;
// } else {
//     if let Some(ns) = field.get_mut(&curr) {
//         // when vertices found
//         if let Some(next) = ns.pop() {
//             acc.push(*curr);
//             _search(&next, acc, field, goal)
//         } else if let Some(prev) = acc.pop() {
//             // when no next AND backtrackable
//             _search(&prev, acc, field, goal)
//         } else {
//             // when searched entirely but no goal
//             return vec![];
//         }
//     } else {
//         // when vertices NOT found
//         return vec![];
//     }
// }

use super::structure::Vertex;
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
    let _curr = match field.get_mut(&curr) {
        // when reached goal
        _ if *curr == *goal => {
            acc.push(*curr);
            return acc;
        }

        // when vertices found
        Some(ns) => {
            if let Some(next) = ns.pop() {
                // go to next depth
                acc.push(*curr);
                next
            } else if let Some(prev) = acc.pop() {
                // backtrack
                prev
            } else {
                // no answer
                return vec![];
            }
        }

        // when next is not registered
        None => return vec![],
    };

    _search(&_curr, acc, field, goal)

    /* the following works on Rust 2018 */
    // match field.get_mut(&curr) {
    //     // when reached goal
    //     _ if *curr == *goal => {
    //         acc.push(*curr);
    //         acc
    //     }

    //     // when vertices found
    //     Some(ns) => {
    //         if let Some(next) = ns.pop() {
    //             // go to next depth
    //             acc.push(*curr);
    //             _search(&next, acc, field, goal) // to be fixed
    //         } else if let Some(prev) = acc.pop() {
    //             // backtrack
    //             _search(&prev, acc, field, goal) // to be fixed
    //         } else {
    //             // no answer
    //             vec![]
    //         }
    //     }

    //     // when next is not registered
    //     None => vec![],
    // }
}

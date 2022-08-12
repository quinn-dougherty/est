use crate::markets::Proba;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

#[derive(Serialize, Deserialize)]
pub struct ManifoldBinaryJson {
    pub question: String,
    pub createdTime: String,
    pub probability: f64,
}

#[derive(Debug)]
pub struct ManifoldBinary {
    pub question: String,
    pub timestamp: String,
    pub probability: Proba,
}

pub struct ManifoldFreeResponse {
    title: String,
    timestamp: String,
    probabilities: HashMap<String, Proba>,
}

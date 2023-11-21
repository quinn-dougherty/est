use crate::markets::{ClosedUnitInterval, ManifoldBinary, ManifoldBinaryJson, Proba};
use reqwest::Client;

pub async fn get_binmarket_constant() -> Result<ManifoldBinary, Box<dyn std::error::Error>> {
    let client = Client::new();
    let response = client
        .get("https://manifold.markets/api/v0/slug/will-carrick-flynn-win-the-general")
        .send()
        .await?
        .json::<ManifoldBinaryJson>()
        .await?;
    let p = Proba::new(response.probability);
    return Ok(ManifoldBinary {
        question: response.question,
        timestamp: response.createdTime,
        probability: p.unwrap(),
    });
}

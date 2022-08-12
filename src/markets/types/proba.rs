use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Proba(f64);

#[derive(Debug, Serialize, Deserialize)]
pub enum ClosedUnitIntervalError {
    Gt1,
    Lt0,
}

pub trait ClosedUnitInterval {
    fn new(p: f64) -> Result<Proba, ClosedUnitIntervalError>;
}

impl Default for Proba {
    fn default() -> Self {
        return Proba(0.0 as f64);
    }
}

impl ClosedUnitInterval for Proba {
    fn new(p: f64) -> Result<Proba, ClosedUnitIntervalError> {
        if p > 1.0 {
            return Result::Err(ClosedUnitIntervalError::Gt1);
        }
        if p < 0.0 {
            return Result::Err(ClosedUnitIntervalError::Lt0);
        }
        return Result::Ok(Proba(p));
    }
}

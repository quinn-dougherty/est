mod markets;
mod utils;
use crate::markets::https::get_binmarket_constant;
use wasm_bindgen::prelude::*;
#[macro_use]
extern crate lalrpop_util;
lalrpop_mod!(pub calculator1); // synthesized by LALRPOP

// When the `wee_alloc` feature is enabled, use `wee_alloc` as the global
// allocator.
#[cfg(feature = "wee_alloc")]
#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

#[wasm_bindgen]
extern "C" {
    fn alert(s: String);
    fn confirm(s: String);
}

#[wasm_bindgen]
pub fn calculator1() -> bool {
    return calculator1::ExprParser::new().parse("22 + 40 * 30").is_ok();
}

#[wasm_bindgen]
pub fn calculator2() -> bool {
    return calculator1::ExprParser::new()
        .parse("((((fdkjfdla22))))")
        .is_ok();
}
#[wasm_bindgen]
pub fn greet1() {
    alert(calculator1().to_string());
}

#[wasm_bindgen]
pub fn greet2() {
    alert(calculator2().to_string());
}

#[wasm_bindgen]
pub async fn carrick() -> JsValue {
    utils::set_panic_hook();
    let market_data = get_binmarket_constant().await.unwrap();
    let market_data_string = format!("{:?}", market_data);
    return JsValue::from_str(&market_data_string);
}

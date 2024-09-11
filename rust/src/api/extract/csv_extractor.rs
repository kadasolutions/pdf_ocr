use std::fs;

use anyhow::Result;

pub fn extract_csv(path: String) -> Result<String> {
    Ok(fs::read_to_string(path)?)
}

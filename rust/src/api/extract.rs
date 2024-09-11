use crate::api::extract::{
    csv_extractor::extract_csv, docx_extractor::extract_docx, pdf_extractor::extract_pdf,
};

use anyhow::anyhow;

pub mod csv_extractor;
pub mod docx_extractor;
pub mod pdf_extractor;

pub struct Extractor {}

impl Extractor {
    #[flutter_rust_bridge::frb(dart_async)]
    pub async fn extract(path: String) -> Option<String> {
        println!("extracccccct ");
        let out = match infer::get_from_path(&path) {
            Ok(Some(file_type)) => match file_type.mime_type() {
                "application/vnd.openxmlformats-officedocument.wordprocessingml.document" => {
                    extract_docx(path)
                }
                "application/pdf" => extract_pdf(path),
                _ => match file_type.extension() {
                    "csv" => extract_csv(path),
                    _ => Err(anyhow!("Unsupported file type")),
                },
            },
            _ => match path.split('.').last().unwrap_or("") {
                "csv" => extract_csv(path),
                _ => Err(anyhow!("Unsupported file type")),
            },
        };
println!("out {:?}", out);
        match out {
            Ok(out) => {
                return Some(out);
            }
            Err(_) => {
                return None;
            }
        }
    }
}

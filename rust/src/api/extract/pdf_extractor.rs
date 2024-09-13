use pdfium_render::prelude::*;

use anyhow::Result;

pub fn extract_pdf(path: String) -> Result<String> {
    let pdfium = Pdfium::new(
        Pdfium::bind_to_library(Pdfium::pdfium_platform_library_name_at_path(
            "pdfium", 
        ))
        .or_else(|_| Pdfium::bind_to_system_library())?,
    );

    let document = pdfium.load_pdf_from_file(&path, None)?;

    Ok(document
        .pages()
        .iter()
        .map(|p| {
            let page_text = p.text().ok();
            match page_text {
                Some(text) => text.all(),
                None => "".to_string(),
            }
        })
        .collect::<Vec<_>>()
        .join("\n"))
}

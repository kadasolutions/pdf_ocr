use docx_rs::*;

use anyhow::Result;

pub fn extract_docx(path: String) -> Result<String> {
    let bytes = std::fs::read(path)?;
    let doc = docx_rs::read_docx(&bytes)?;
    Ok(doc
        .document
        .children
        .iter()
        .map(|x| x.get_text())
        .filter(|x| x.is_some() && !x.as_ref().unwrap().is_empty())
        .flatten()
        .collect::<Vec<_>>()
        .join("\n"))
}

pub trait GetText {
    fn get_text(&self) -> Option<String>;
}

impl GetText for DocumentChild {
    fn get_text(&self) -> Option<String> {
        match self {
            DocumentChild::Paragraph(p) => Some(p.raw_text()),
            DocumentChild::Table(t) => Some(
                t.rows
                    .iter()
                    .map(|x| match x {
                        TableChild::TableRow(r) => r
                            .cells
                            .iter()
                            .map(|c| match c {
                                TableRowChild::TableCell(c) => c
                                    .children
                                    .iter()
                                    .filter_map(|x| x.get_text())
                                    .collect::<String>(),
                            })
                            .collect::<Vec<_>>()
                            .join("\t"),
                    })
                    .collect::<Vec<_>>()
                    .join("\n"),
            ),
            _ => None,
        }
    }
}

impl GetText for TableCellContent {
    fn get_text(&self) -> Option<String> {
        match self {
            TableCellContent::Paragraph(p) => Some(p.raw_text()),
            TableCellContent::Table(t) => Some(
                t.rows
                    .iter()
                    .map(|x| match x {
                        TableChild::TableRow(r) => r
                            .cells
                            .iter()
                            .map(|c| match c {
                                TableRowChild::TableCell(c) => c
                                    .children
                                    .iter()
                                    .filter_map(|content| content.get_text())
                                    .collect::<String>(),
                            })
                            .collect::<String>(),
                    })
                    .collect::<_>(),
            ),
            _ => None,
        }
    }
}

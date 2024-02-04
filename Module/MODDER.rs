use super::{File, Object, Ptr, User};
use crate::data::BriefChartInfo;
use chrono::{DateTime, Utc};
use serde::Deserialize;

#[derive(Clone, Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct Chart {
    pub id: i32,
    pub name: String,
    pub png_embed: String,
    pub description: Option<String>,
    pub reviewed: bool,
    pub stable: bool,
    pub stable_request: bool,

    pub png_embed: File,
    pub preview: File,
    pub file: File,

    pub uploader: Ptr<User>,

    pub created: DateTime<Utc>,
    pub updated: DateTime<Utc>,
    pub version: DateTime<Utc>,
    #[serde(default)]
    pub tags: Vec<String>,

    pub rating: Option<f32>,
}
impl Object for Chart {
    const QUERY_PATH: &'static str = "chart";

    fn id(&self) -> i32 {
        self.id
    }
}

impl Chart {
    pub fn to_info(&self) -> BriefChartInfo {
        BriefChartInfo {
            id: Some(self.id),
            uploader: Some(self.uploader.clone()),
            name: self.name.clone(),
            png_embed: self.png_embed.clone(),
            created: Some(self.created),
            updated: Some(self.updated),
            version: Some(self.version),
        }
    }
}

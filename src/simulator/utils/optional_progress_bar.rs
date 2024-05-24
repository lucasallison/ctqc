use indicatif::{ProgressBar, ProgressStyle};

/// Either prints and updates the progress bar, or does nothing.
pub struct OptionalProgressBar {
    progress_bar: Option<ProgressBar>,
}

impl OptionalProgressBar {
    pub fn new(is_some: bool, len: u64, style: &str) -> OptionalProgressBar {
        if is_some {
            let pb = ProgressBar::new(len);
            pb.set_style(ProgressStyle::with_template(style).unwrap());

            return OptionalProgressBar {
                progress_bar: Some(pb),
            };
        } else {
            return OptionalProgressBar { progress_bar: None };
        }
    }

    pub fn set_message(&self, msg: String) {
        if let Some(pb) = self.progress_bar.as_ref() {
            pb.set_message(msg);
        }
    }

    pub fn inc(&self, delta: u64) {
        if let Some(pb) = self.progress_bar.as_ref() {
            pb.inc(delta);
        }
    }

    pub fn finish(&self) {
        if let Some(pb) = self.progress_bar.as_ref() {
            pb.finish();
        }
    }
}

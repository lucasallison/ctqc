use indicatif::ProgressBar;
use indicatif::ProgressStyle;

/// Either prints and updates the progress bar, or does nothing.
pub struct OptionalProgressBar {
    progress_bar: Option<ProgressBar>,
    measurement_pb: bool,
}

impl OptionalProgressBar {
    pub fn new(is_some: bool, len: u64, measurement_pb: bool) -> OptionalProgressBar {
        if is_some {
            let pb = ProgressBar::new(len);
            pb.set_style(
                ProgressStyle::with_template(&Self::get_pb_style(measurement_pb)).unwrap(),
            );

            return OptionalProgressBar {
                progress_bar: Some(pb),
                measurement_pb,
            };
        } else {
            return OptionalProgressBar {
                progress_bar: None,
                measurement_pb,
            };
        }
    }

    pub fn prepend_to_style(&self, style: &str) {
        if let Some(pb) = self.progress_bar.as_ref() {
            let pb_style = style.to_owned() + &Self::get_pb_style(self.measurement_pb);
            pb.set_style(ProgressStyle::with_template(&pb_style).unwrap());
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

    fn get_pb_style(measurement_pb: bool) -> String {
        let progress_items = if measurement_pb { "qubits" } else { "gates" };
        let pb_style = "[{elapsed_precise}] {bar:40.green/red} {pos}/{len} ".to_owned()
            + progress_items
            + " ({percent}%) -- {msg}";
        pb_style
    }
}

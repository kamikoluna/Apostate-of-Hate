use std::collections::HashMap;

// This struct has one lifetime parameter, 'src. The name is only used within the struct's definition.
#[derive(Debug)]
struct Config<'src> {
    hostname: &'src str,
    username: &'src str,
}

// This function also has a lifetime parameter, 'cfg. 'cfg is attached to the "config" parameter, which
// establishes that the data in "config" lives at least as long as the 'cfg lifetime.
// The returned struct also uses 'cfg for its lifetime, so it can live at most as long as 'cfg.
fn parse_config<'cfg>(config: &'cfg str) -> Config<'cfg> {
    let key_values: HashMap<_, _> = config
        .lines()
        .filter(|line| !line.starts_with('#'))
        .filter_map(|line| line.split_once('='))
        .map(|(key, value)| (key.trim(), value.trim()))
        .collect();
    Config {
        hostname: key_values["hostname"],
        username: key_values["username"],
    }
}

fn main() {
    let config = parse_config(
        r#"hostname = foobar
username=barfoo"#,
    );
    println!("Parsed config: {:#?}", config);
}

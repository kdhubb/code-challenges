#[macro_use]
extern crate lazy_static;

mod day2;
mod day3;

fn main() {
    let arg_matches = clap::command!()
        .arg(
            clap::Arg::new("day")
                .help("The day of advent of code to run")
                .value_parser(clap::value_parser!(u8).range(1..31))
                .action(clap::ArgAction::Set)
                .exclusive(true)
                .num_args(1)
                .required(true),
        )
        .get_matches();

    let day: &u8 = arg_matches.get_one("day").unwrap();
    match day {
        1 => println!("Day 1 was written in Go."),
        2 => day2::run(),
        3 => day3::run(),
        _ => panic!("invalid day"),
    }
}

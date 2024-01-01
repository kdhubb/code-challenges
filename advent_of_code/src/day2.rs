pub fn run() {
    let file = std::fs::read_to_string("bob_input/02.txt").unwrap();
    println!("part 1: {}", part1(&file));
    println!("part 2: {}", part2(&file));
}

fn part1(file: &str) -> i32 {
    let games = process(file);
    let red = 12;
    let green = 13;
    let blue = 14;

    let mut sum = 0;
    for game in games {
        if game.max_red <= red && game.max_green <= green && game.max_blue <= blue {
            sum += game.number
        }
    }

    sum
}

fn part2(file: &str) -> i32 {
    let games = process(file);

    let mut sum = 0;
    for game in games {
        sum += game.max_blue * game.max_green * game.max_red;
    }

    sum
}

#[derive(Debug)]
struct Game {
    number: i32,
    max_red: i32,
    max_blue: i32,
    max_green: i32,
}

fn process(file: &str) -> Vec<Game> {
    let file = file.trim();

    let mut lines = file.lines();
    let mut games = Vec::new();
    while let Some(line) = lines.next() {
        let (game, cubes) = line.split_once(':').unwrap();

        let game = game.split_at("Game ".len()).1.parse::<i32>().unwrap();

        let cube_sets = cubes.split(';');
        let mut max_red = i32::MIN;
        let mut max_blue = i32::MIN;
        let mut max_green = i32::MIN;
        for cube_set in cube_sets {
            let cubes = cube_set.split(',');
            for cube in cubes {
                let cube = cube.trim();
                let (number, color) = cube.split_once(' ').unwrap();
                let number = number.parse::<i32>().unwrap();
                match color {
                    "red" => max_red = max_red.max(number),
                    "green" => max_green = max_green.max(number),
                    "blue" => max_blue = max_blue.max(number),
                    _ => panic!("Unknown color"),
                }
            }
        }

        games.push(Game {
            number: game,
            max_red: max_red,
            max_green: max_green,
            max_blue: max_blue,
        });
    }

    games
}

#[cfg(test)]
mod test {
    const FILE: &str = r#"
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"#;

    #[test]
    fn part1() {
        assert_eq!(super::part1(FILE), 8);
    }

    #[test]
    fn part2() {
        assert_eq!(super::part2(FILE), 2286);
    }
}

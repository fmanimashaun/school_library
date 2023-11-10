# OOP school library

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
- [🛠 Built With](#built-with)
  - [Tech Stack](#tech-stack)
  - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

## 📖 School Library command-Line App <a name="about-project"></a>

**School Library App** is a Ruby project focused on implementing classes and objects to manage a school library. This initial step involves creating classes to represent students and teachers.

## 🛠 Built With <a name="built-with"></a>

- Ruby

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Server</summary>
  <ul>
    <li>Ruby</li>
  </ul>
</details>

<!-- Features -->

### Key Feature <a name="key-features"></a>

- Create class `Person` with  the following:
  - Instance vars: `@id`, `@name`, and `@age`.
  - Constructor with `name`,  `age`, and `parent_permission` as parameter. `name` and `parent_permission` are optional and have default values of `"Unknown"` and `true`.
  - Getters for `@id`, `@name`, and `@age`.
  - Setters for `@name` and `@age`.
  - Private method `of_age?` that returns `true` if `@age` is greater or equal to 18 and `false` otherwise.
  - Public method `can_use_services?` that returns `true` if person is of age or if they have permission from parents.
- Create class `Student` with the following:
  - Inherits from `Person`.
  - Constructor extends parent's constructor by adding `@classroom` and a parameter for it.
  - Method `play_hooky` that returns `"¯\(ツ)/¯"`.
- Create class `Teacher` with the following:
  - Inherits from `Person`.
  - Constructor extends parent's constructor by adding `@specialization` and a parameter for it.
  - Override `can_use_services?` so it always returns `true`.
- Each class are be saved in a separate file.

<p align="right"><a href="#readme-top">👆</a></p>

<!-- Getting Started -->

## 💻 Getting Started <a name="getting-started"></a>

To get started with the project, follow the steps below.

### Prerequisites

To run this project, ensure you have the following installed:

- [Git](https://git-scm.com/)
- [Ruby](https://www.ruby-lang.org/en/)
- A code editor (e.g., [VsCode](https://code.visualstudio.com/))

### Setup

Clone the repository to your local machine:

```bash
git clone https://github.com/fmanimashaun/school_library.git
```

### Usage

To run the program, you can use a Ruby interpreter. For example, to interact with the code, use the following:

```ruby
irb
```

Then, load the required files and start using the classes.

<p align="right"><a href="#readme-top">👆</a></p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Fisayo Michael Animashaun**

- GitHub: [@fmanimashaun](https://github.com/fmanimashaun)
- Twitter: [@fmanimashaun](https://twitter.com/fmanimashaun)
- LinkedIn: [Fisayo Michael Animashaun ](https://linkedin.com/in/fmanimashaun)

<p align="right"><a href="#readme-top">👆</a></p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [Add your future feature ideas here.]

<p align="right"><a href="#readme-top">👆</a></p>

<!-- Contributing -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the issues page.

https://github.com/fmanimashaun/school_library/issues

<p align="right"><a href="#readme-top">👆</a></p>

<!-- Show your support -->

## ⭐️ Show your support <a name="support"></a>

If you like this project leave a start for it.

<p align="right"><a href="#readme-top">👆</a></p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I'd like to thank Microverse for helping us in the journey to become a Fullstack developer.

<p align="right"><a href="#readme-top">👆</a></p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right"><a href="#readme-top">👆</a></p>
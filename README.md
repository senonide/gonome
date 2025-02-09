# Gonome app template

Simple "Hello World" app written in Go using libadwaita as the GUI framework and flatpak as the distribution method.

> [!NOTE]
> The project is strongly inspired by the official GNOME sample projects of other officially supported programming languages. Since the `meson` builder system does not support Go, it has been replaced by the `make` system to manage the whole process of compilation, installation and/or execution.

## Overview

This repository serves as a template for creating GNOME applications using Go programming language with GTK 4 and libadwaita, using flatpak as the distribution method. Designed with modern Linux desktop integration in mind, this template provides a complete foundation for developing native GNOME applications that follow the latest design patterns and technical specifications.

The template handles the complexity of setting up a proper GNOME application structure, including automatic desktop shortcut creation and DBus service integration, allowing developers to focus on implementing their application logic rather than infrastructure.

### Key Components:

- **Go + GTK 4**: Combines Go's performance with GTK 4's modern UI capabilities
- **Libadwaita Integration**: Ensures applications follow GNOME's Human Interface Guidelines
- **Flatpak Packaging**: Ready-to-use configuration for distributing via Flatpak
- **DBus Service**: Pre-configured service for system integration and inter-process communication
- **Desktop Integration**: Automatic shortcut creation and proper application registration

## Installation

> [!IMPORTANT]
> The first build may take longer because the libadwaita Go bindings compile on a single thread. Subsequent builds will be much faster once the packages are cached.

### Build from source
Ensure you have Go installed, then run:

```bash
# Clone the repository
git clone https://github.com/senonide/gonome.git
cd gonome

# Build the project
make build

# Run the project
make run

# Build and install the flatpak
make flatpak

# Run the flatpak
make flatpak.run
```

## Contributing
Contributions are welcome! Feel free to fork the repository, open issues, and submit pull requests to improve the project.

## License

This project is licensed under the GNU General Public License v3. See the LICENSE file for details.

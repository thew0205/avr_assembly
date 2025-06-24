# Doing Much from Little – AVR Assembly Projects on ATmega328P

This repository showcases low-level microcontroller development using **AVR assembly** on the **ATmega328P**. All code is written from scratch using only the official datasheet and a deep understanding of the microcontroller's internals. No Arduino libraries. No C code. Just **assembly, custom linker scripts, and raw memory control**.

---

## 📁 Projects Included

| Project         | Description |
|----------------|-------------|
| `led_chaser.s`     | Two LEDs chase each other endlessly with wrap-around logic |
| `binary_counter.s` | Binary counter displayed via LEDs |
| `exclusive_or.s`   | Logical XOR between current and previous output states |

---

## 🛠️ Requirements

### Hardware
- ATmega328P (Arduino Uno used as ISP)
- LEDs + resistors
- Breadboard + jumper wires
- Optional: 16x2 LCD display (for extended demo)
- Optional: External oscillator

### Software
- [AVR-GCC Toolchain](https://www.microchip.com/en-us/tools-resources/develop/microcontrollers/avr-and-arm-toolchains-c-compilers)
- `avrdude` – Flashing tool
- `make`

---

## 🚀 Build & Upload

Each `.s` file can be assembled and flashed with:
```bash
make led_chaser.upload
make binary_counter.upload
make exclusive_or.upload

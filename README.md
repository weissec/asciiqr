# ASCIIQR
ASCIIQR is a simple wrapper script for the qrencode tool that generates QR codes in ASCII format with both standard and inverted colour schemes. While qrencode natively supports ASCII output, it only produces white-on-black QR codes, which can be difficult to embed in emails or documents with light backgrounds. This script automatically generates both white-on-black and black-on-white versions, allowing you to choose the most suitable format for your use case.
Features

### Generates ASCII QR codes using qrencode
Automatically creates both standard and inverted colour versions.
Useful for embedding QR codes in plain-text environments such as emails or terminals.

### Requirements
qrencode must be installed on your system.

### Usage
```
chmod +x genqr.sh
./genqr.sh [URL or text]
```

This will output two QR codes in your terminal: one with the default white-on-black scheme, and one with inverted colours.
The tools will also save an HTML file with the preformatted code (<pre>) ready to be embedded.

### Example
`./genqr.sh https://example.com`

### Credits
Inspired by Michael Altfield and his work on terminal-based QR code generation.

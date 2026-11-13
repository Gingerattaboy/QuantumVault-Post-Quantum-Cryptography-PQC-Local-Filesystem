# 🔐 QuantumVault – Post-Quantum Cryptography Local Filesystem

## Project Overview

QuantumVault is a secure local filesystem designed using Post-Quantum Cryptography (PQC). It aims to protect confidential files against potential future threats posed by quantum computers.

The project combines post-quantum cryptographic algorithms with a virtual filesystem to provide transparent file encryption and decryption.

## Problem Statement

Traditional cryptographic algorithms such as RSA and ECC may become vulnerable to sufficiently powerful quantum computers. This creates a security risk for confidential information that needs long-term protection.

QuantumVault aims to address this challenge by implementing post-quantum cryptographic techniques to secure locally stored files.

## Objectives

- Implement post-quantum key encapsulation using ML-KEM.
- Implement secure file encryption and decryption.
- Develop a virtual filesystem using Rust and FUSE.
- Integrate C-based cryptographic functions with Rust.
- Implement password-protected key management.
- Implement digital signatures using ML-DSA.
- Provide secure vault mounting, unmounting, locking and unlocking.
- Implement best-effort memory zeroization for sensitive data.

## Technology Stack

| Component | Technology |
|---|---|
| Programming Languages | C and Rust |
| Post-Quantum Cryptography | liboqs |
| Key Encapsulation | ML-KEM |
| Digital Signatures | ML-DSA |
| Filesystem | FUSE |
| Key Derivation | Argon2id |
| File Encryption | AES-256-GCM |
| Development Environment | Ubuntu Linux |
| Version Control | Git and GitHub |

## Project Modules

### 1. Cryptographic Engine
Responsible for post-quantum key generation, encryption, decryption, digital signatures and key management.

### 2. Virtual Filesystem
Responsible for mounting the secure virtual directory and transparently handling file operations.

### 3. Key Management
Responsible for password-based protection of cryptographic private keys and vault locking and unlocking.

### 4. Command-Line Interface
Provides an interface for users to create, mount, unmount and manage the secure vault.

## Development Timeline

- Week 1: Environment setup and basic cryptographic and filesystem implementation.
- Week 2: C-Rust integration and automatic file encryption/decryption.
- Week 3: Key management, digital signatures and memory security.
- Week 4: Testing, optimization, documentation and final demonstration.

## Project Goal

To develop a functional academic prototype of a post-quantum encrypted local filesystem that demonstrates secure file storage, transparent encryption and protection against unauthorized access.

## Project Status

🚧 Under Development

## Team Members

- Member 1 – Cryptographic Engine (C and liboqs)
- Member 2 – Virtual Filesystem (Rust and FUSE)

---

**QuantumVault – Securing Today's Data Against Tomorrow's Threats.**

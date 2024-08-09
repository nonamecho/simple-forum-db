```mermaid
---
title: Simple forum
---
erDiagram
    USER ||--o{ POST : creates
    USER ||--o{ POST-LIKE : creates
    USER ||--o{ COMMENT : creates
    USER ||--o{ COMMENT-LIKE : creates
    POST ||--o{ POST-LIKE : contains
    POST ||--o{ COMMENT : contains
    COMMENT ||--o{ COMMENT-LIKE : contains
```

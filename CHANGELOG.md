# 1.0.0

- Initial release.

# 1.1.0

- Query count and Query time are now threadsafe.

# 1.2.0

- Use concurrent-ruby gem in favor of deprecated atomic gem. - [#4](https://github.com/peek/peek-pg/pull/4) [@lucasmazza](https://github.com/lucasmazza)
- Instrument prepared statements. - [#5](https://github.com/peek/peek-pg/pull/5) [@lucasmazza](https://github.com/lucasmazza)

# 1.3.0

- Use prepend to instrument Postgres queries `alias_method_chain` - [#8](https://github.com/peek/peek-pg/pull/5) [@8398a7](https://github.com/8398a7)

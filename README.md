# knockout-validations-extender

Adds a ``configurations`` extender to knockout, that allows you to set configurations to a observable.

# API

*All methods receive a configuration name. The name is the path to your config value, using dot notation.*

- observable.getConfig(name) # returns computable
- observable.hasConfig(name) # returns computable
- observable.isConfig(name) # returns computable
  + returns true if config value is a truthful value
- observable.isntConfig(name) # returns computable
  + returns false if config value is a falsy value
- observable.setConfig(name, val) # returns observable
- observable.toggleConfig(name, val) # returns observable


# Usage

```
serial = ko.observable().extend
  configurations:
    visible: true
    conditions:
      big: true

serial.setConfig('visible', false)

ko.unwrap serial.getConfig('conditions.big') # true
## serial.getConfig('conditions.big')() - same !!

if ko.unwrap serial.isConfig('conditions.big')
  serial.setConfig('conditions.big', false)
```

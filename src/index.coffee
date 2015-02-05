ko = require 'knockout'
_ = require 'lodash'
pathval = require 'pathval'

ko.extenders.configurations = (target, configurations)->
  configurations = configurations or {}
  configurations = ko.observable(ko.mapping.fromJS(configurations))

  target.getConfig = (name)->
    ko.computed ()->
      conf = ko.mapping.toJS(configurations)
      pathval.get(conf, name)
  target.hasConfig = (name)-> ko.computed ()-> ko.unwrap(target.getConfig(name))?
  target.isConfig = (name)-> ko.computed ()-> !!ko.unwrap(target.getConfig(name))
  target.isntConfig = (name)-> ko.computed ()->!ko.unwrap(target.getConfig(name))
  target.setConfig = (name, val)->
    conf = ko.mapping.toJS(configurations)
    pathval.set conf, name, val
    configurations ko.mapping.fromJS(conf)
    return target
  target.toggleConfig = (name)->
    conf = ko.mapping.toJS(configurations)
    pathval.set conf, name, !ko.unwrap(target.getConfig(name))
    configurations ko.mapping.fromJS(conf)
    return target

  target.getConfigs = ()-> return ko.mapping.toJS(configurations)

  return target


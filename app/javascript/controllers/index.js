// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// flatpickr datetime selector
import Flatpickr from 'stimulus-flatpickr'
require("flatpickr/dist/flatpickr.css")
application.register('flatpickr', Flatpickr)

// Alert
import { Alert } from "tailwindcss-stimulus-components"
application.register('alert', Alert)

// Dropdown
import { Dropdown } from "tailwindcss-stimulus-components"
application.register('dropdown', Dropdown)
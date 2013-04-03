App.BusinessDay = Em.Object.extend
  appointments: []
  time_slots: []

App.Account = Em.Object.extend
  name: "daveCo"

App.TimeSlots = Em.Object.extend
  availabe_reps: []

App.RepQueue = Em.Object.extend
  rep_list: []
  
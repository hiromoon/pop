export const CHANGE_TEXT = 'CHANGE_TEXT'

export const changeText = (key, value) => ({
  type: CHANGE_TEXT,
  payload: {
    [key]: value,
  },
})

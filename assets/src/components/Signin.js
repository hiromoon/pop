import React from 'react'
import PropTypes from 'prop-types'
import { withStyles } from '@material-ui/core/styles'
import Paper from '@material-ui/core/Paper'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import TextField from '@material-ui/core/TextField'

const styles = theme => ({
  main: {
    margin: theme.spacing.unit * 3,
    width: 'auto',
    display: 'block',
    [theme.breakpoints.up(400 + theme.spacing.unit * 3 * 2)]: {
      width: 400,
      marginLeft: 'auto',
      marginRight: 'auto',
    },
  },
  container: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    padding: theme.spacing.unit * 3,
  },
  input: {
    width: '100%',
  },
  title: {},
  submitButton: {
    marginTop: theme.spacing.unit * 4,
  },
})

const Signin = ({
  classes,
  userId,
  password,
  onChangeUserId,
  onChangePassword,
}) => (
  <main className={classes.main}>
    <Paper className={classes.container}>
      <Typography variant="h2" className={classes.title}>
        Signin
      </Typography>
      <TextField
        label="userid"
        margin="normal"
        className={classes.input}
        value={userId}
        onChange={onChangeUserId}
      />
      <TextField
        type="password"
        label="password"
        className={classes.input}
        value={password}
        onChange={onChangePassword}
      />
      <Button
        fullWidth
        variant="contained"
        color="primary"
        className={classes.submitButton}
      >
        SiginIn
      </Button>
    </Paper>
  </main>
)

Signin.propTypes = {
  classes: PropTypes.object.isRequired,
  userId: PropTypes.string.isRequired,
  password: PropTypes.string.isRequired,
  onChangeUserId: PropTypes.func.isRequired,
  onChangePassword: PropTypes.func.isRequired,
}

export default withStyles(styles)(Signin)

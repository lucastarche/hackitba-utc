//Import mui and create a welcome page
import React from 'react';
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';
import { Link } from 'react-router-dom';

function Welcome () {
    return(
        <div>
            <AppBar position="static">
                <Toolbar>
                    <IconButton edge="start" color="inherit" aria-label="menu">
                        <MenuIcon />
                    </IconButton>
                    <Typography variant="h6">
                        Welcome to GrannyGrannyGO!
                    </Typography>
                    <Button color="inherit">
                        <Link to="/about">About</Link>
                    </Button>
                </Toolbar>
            </AppBar>
        </div>
    )
}

export default Welcome;
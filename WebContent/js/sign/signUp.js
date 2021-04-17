$(function() {
    // Sign In Sign Up Web Pagae =====Start============================================================//
    // to swictch between Sign-in & Sign-up on the main siginsignup.html page animation 
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });    

    // Sign Up form input validation Function//
    const form = document.getElementById('form');
    const username = document.getElementById('username');
    const username2 = document.getElementById('username2');
    const email = document.getElementById('email');
    const password = document.getElementById('password');
    const password2 = document.getElementById('password2');
    // Form submit event, when user clicks the Sign-up button //
    form.addEventListener('submit', e =>
    {
        e.preventDefault(); // preventing submission to a server
        
        checkInputs();
    });

    function checkInputs() {
        // get the value from the input
        // use trim to remove the whitespaces
        const usernameValue = username.value.trim();
        const username2Value = username2.value.trim();
        const emailValue = email.value.trim();
        const passwordValue = password.value.trim();
        const password2Value = password2.value.trim();

        if(usernameValue === '') {
            // show Error
            // add Error class
            setErrorFor(username, 'Username cannot be blank');
        } else {
            // add Success class
            setSuccessFor(username);
        }
        if(username2Value === '') {
            // show Error
            // add Error class
            setErrorFor(username2, 'Username cannot be blank');
        } else {
            // add Success class
            setSuccessFor(username2);
        }
        
        if(emailValue === '') {
            setErrorFor(email, 'Email cannot be blank');
        } else if (!isEmail(emailValue)) {
            setErrorFor(email, 'Not a valid email');
        } else {
            setSuccessFor(email);
        }
        
        if(passwordValue === '') {
            setErrorFor(password, 'Password cannot be blank');
        } else {
            setSuccessFor(password);
        }
        
        if(password2Value === '') {
            setErrorFor(password2, 'Password2 cannot be blank');
        } else if(passwordValue !== password2Value) {
            setErrorFor(password2, 'Passwords does not match');
        } else{
            setSuccessFor(password2);
        }

        //show success message
    }

    function setErrorFor(input, message) {
        const formControl = input.parentElement;  // .form-control
        const small = formControl.querySelector('small');
        // add the Error message
        // add Error class
        formControl.className = 'form-control error';
        small.innerText = message;
    }
    
    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = 'form-control success';
    }
    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = 'form-control success';
    }
        
    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
    // Sign In Sign Up Web Pagae =====End============================================================//
   
});







    




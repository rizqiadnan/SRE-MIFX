<?php
function helloWorld() {
    echo "Hello, Docker World!\n";
    
    // Additional function to show system info
    echo "\nSystem Information:\n";
    echo "PHP Version: " . phpversion() . "\n";
    echo "Operating System: " . php_uname() . "\n";
}

helloWorld();
?>
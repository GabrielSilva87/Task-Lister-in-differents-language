<?php
session_start();

if (!isset($_SESSION['tasks'])) {
    $_SESSION['tasks'] = [];
}

function getTasks() {
    return $_SESSION['tasks'];
}

function addTask($task) {
    $_SESSION['tasks'][] = $task;
}

function updateTask($index, $task) {
    if (isset($_SESSION['tasks'][$index])) {
        $_SESSION['tasks'][$index] = $task;
    }
}

function removeTask($index) {
    if (isset($_SESSION['tasks'][$index])) {
        unset($_SESSION['tasks'][$index]);
        $_SESSION['tasks'] = array_values($_SESSION['tasks']);
    }
}
?>
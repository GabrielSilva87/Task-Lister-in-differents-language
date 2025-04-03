{-# LANGUAGE OverloadedStrings #-}

import qualified GI.Gtk as Gtk
import Control.Monad (void)

data Task = Task String deriving (Show)

main :: IO ()
main = do
    _ <- Gtk.initGUI

    window <- Gtk.windowNew
    Gtk.set window [Gtk.windowTitle Gtk.:= "Listador de Tarefas", Gtk.windowDefaultWidth Gtk.:= 400, Gtk.windowDefaultHeight Gtk.:= 300]

    vbox <- Gtk.boxNew Gtk.OrientationVertical 5
    taskInput <- Gtk.entryNew
    addButton <- Gtk.buttonNewWithLabel "Adicionar Tarefa"
    removeButton <- Gtk.buttonNewWithLabel "Remover Tarefa"
    taskList <- Gtk.listStoreNew [Gtk.typeString]
    treeView <- Gtk.treeViewNewWithModel taskList
    renderer <- Gtk.cellRendererTextNew
    column <- Gtk.treeViewColumnNewWithAttributes "Tarefas" renderer [("text", 0)]
    Gtk.treeViewAppendColumn treeView column

    void $ Gtk.on addButton Gtk.buttonActivated $ do
        taskDescription <- Gtk.entryGetText taskInput
        if not (null taskDescription)
            then do
                Gtk.listStoreAppend taskList (Gtk.toGValue taskDescription)
                Gtk.entrySetText taskInput ""
            else return ()

    void $ Gtk.on removeButton Gtk.buttonActivated $ do
        selection <- Gtk.treeViewGetSelection treeView
        (model, iter) <- Gtk.treeSelectionGetSelected selection
        case iter of
            Just _ -> do
                Gtk.listStoreRemove model iter
            Nothing -> return ()

    Gtk.boxPackStart vbox taskInput Gtk.PackNatural 0
    Gtk.boxPackStart vbox addButton Gtk.PackNatural 0
    Gtk.boxPackStart vbox removeButton Gtk.PackNatural 0
    Gtk.boxPackStart vbox treeView Gtk.PackGrow 0

    Gtk.containerAdd window vbox
    Gtk.onDestroy window Gtk.mainQuit
    Gtk.widgetShowAll window

    Gtk.mainGUI
import sublime, sublime_plugin
import datetime

class PyHeadCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        self.view.run_command("insert_snippet",
            {
                "contents":"#!/user/bin python""\n"
                "# -*- coding:utf-8 -*- ""\n"
                "'''""\n"
                " @Author:      author""\n"
                " @Email:       xx@xx.com\n"
                " @DateTime:    ""%s" %datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") +"\n"
                " @Description: Description ""\n"
                # " @FileName : ""%s" %__file__ +"\n"
                "'''""\n"
            }
        )

class JavaHeadCommand(sublime_plugin.TextCommand):
    def run(self,edit):
        self.view.run_command("insert_snippet",
            {
                "contents":"/**""\n"
                " * @Author:      author""\n"
                " * @Email:       xx@xx.com\n"
                " * @DateTime:    ""%s" %datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") +"\n"
                " * @Description: Description ""\n"
                " */""\n"
            }

        )
class ShHeadCommand(sublime_plugin.TextCommand):
    def run(self,edit):
        self.view.run_command("insert_snippet",
            {
                "contents":"#!/bin/sh""\n"
                "# @Author:       author""\n"
                "# @Email:        xx@xx.com\n"
                "# @DateTime:     ""%s" %datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") +"\n"
                "# @Description:  Description ""\n"
            }
        )
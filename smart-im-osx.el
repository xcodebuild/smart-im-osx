;; smart-im-osx.el --- Make input method smarter in Mac OS X only  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  codefalling

;; Author: codefalling(defun smart-im-osx-read-from-buffer () <codefalling@codefallingdeiMac.local>
;; Keywords: extensions

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:



(provide 'smart-im-osx)

(defvar smart-im-osx-us-keyboard-name "com.apple.keylayout.US")

(defun smart-im-osx-read-from-buffer ()
  "Read im name from *smart-im*"
  (if (get-buffer "*smart-im*")
      (with-current-buffer "*smart-im*"
        (beginning-of-buffer)
        (replace-regexp-in-string "\n$" ""
                              (thing-at-point 'line)))
    ))

(defun smart-im-osx-get-current-im ()
  "start im-select to get current im"
  (if (get-buffer "*smart-im*")
      (kill-buffer "*smart-im*"))
  (call-process "im-select" nil "*smart-im*")
  (smart-im-osx-read-from-buffer)
  )

(defun smart-im-osx-select-to (imname)
  "select to im with name of it"
  (call-process "im-select" nil nil nil imname)
  )
(defun smart-im-osx-select-to-us-keyboard ()
  "backup current keyboard&select to us keyboard"
  (smart-im-osx-get-current-im)
  (smart-im-osx-select-to smart-im-osx-us-keyboard-name))

(defun smart-im-osx-is-us-keyboard (imname)
  "judge is im us keyboard"
  (string= imname smart-im-osx-us-keyboard-name)
  )
(defun smart-im-osx-select-back ()
  "Select back to im store in *smart-im* if is not com.apple.keylayout.US"
  (let ((back-im (smart-im-osx-read-from-buffer)))
    (if (and back-im (not (smart-im-osx-is-us-keyboard back-im)))
        (smart-im-osx-select-to back-im)
        )
    )
  )

(defun smart-im-osx-enable-for-evil ()
  (add-hook 'evil-normal-state-entry-hook 'smart-im-osx-select-to-us-keyboard)
  (add-hook 'evil-insert-state-entry-hook 'smart-im-osx-select-back)
  )

;;; smart-im-osx.el ends here

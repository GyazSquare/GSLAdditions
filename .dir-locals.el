;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((nil
  . ((eval . (setenv "DEVELOPER_DIR"
                     "/Applications/Xcode.app/Contents/Developer"))
     (fill-column . 80)
     (whitespace-style . (face lines indentation:space))
     (eval . (set (make-local-variable 'project-dir)
                  (file-name-directory
                   (let ((d (dir-locals-find-file ".")))
                     (if (stringp d) d (car d))))))
     (eval . (set (make-local-variable 'gsl-addiotions-root)
                  (expand-file-name "GSLAdditions" project-dir)))
     (eval . (set (make-local-variable 'foundation-gsl-addiotions-root)
                  (expand-file-name "FoundationGSLAdditions" project-dir)))
     (eval . (set (make-local-variable 'uikit-gsl-addiotions-root)
                  (expand-file-name "UIKitGSLAdditions" project-dir)))))
 (objc-mode
  . ((flycheck-objc-clang-xcrun-sdk . "iphoneos10.3")
     (flycheck-objc-clang-arc . t)
     (flycheck-objc-clang-modules . t)
     (flycheck-objc-clang-archs . ("arm64" "armv7"))
     (flycheck-objc-clang-ios-version-min . "8.0")))
 ("GSLAdditions"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list gsl-addiotions-root)))))))
 ("FoundationGSAdditions"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list foundation-gsl-addiotions-root)))))))
 ("UIKitGSAdditions"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list uikit-gsl-addiotions-root)))))))
 ("GSLAdditionsTests"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list gsl-addiotions-root
                            foundation-gsl-addiotions-root
                            uikit-gsl-addiotions-root)))
         (eval . (add-to-list
                  'flycheck-objc-clang-framework-paths
                  (expand-file-name
                   "Platforms/iPhoneOS.platform/Developer/Library/Frameworks"
                   (getenv "DEVELOPER_DIR")))))))))

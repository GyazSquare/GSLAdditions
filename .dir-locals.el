;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

(("GSLAdditionsTests"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list gsl-additions-root
                            foundation-gsl-additions-root
                            uikit-gsl-additions-root)))
         (eval . (add-to-list
                  'flycheck-objc-clang-framework-paths
                  (expand-file-name
                   "Platforms/iPhoneOS.platform/Developer/Library/Frameworks"
                   (getenv "DEVELOPER_DIR"))))))))
 ("UIKitGSAdditions"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list uikit-gsl-additions-root)))))))
 ("FoundationGSAdditions"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list foundation-gsl-additions-root)))))))
 ("GSLAdditions"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list gsl-additions-root)))))))
 (objc-mode
  . ((flycheck-objc-clang-xcrun-sdk . "iphoneos")
     (flycheck-objc-clang-arc . t)
     (flycheck-objc-clang-modules . t)
     (flycheck-objc-clang-archs . ("arm64" "armv7"))
     (flycheck-objc-clang-ios-version-min . "8.0")))
 (nil
  . ((eval . (setenv "DEVELOPER_DIR"
                     "/Applications/Xcode.app/Contents/Developer"))
     (fill-column . 80)
     (whitespace-style . (face lines indentation:space))
     (eval . (set (make-local-variable 'project-dir)
                  (file-name-directory
                   (let ((d (or (dir-locals-find-file ".") default-directory)))
                     (if (stringp d) d (car d))))))
     (eval . (set (make-local-variable 'gsl-additions-root)
                  (expand-file-name "GSLAdditions" project-dir)))
     (eval . (set (make-local-variable 'foundation-gsl-additions-root)
                  (expand-file-name "FoundationGSLAdditions" project-dir)))
     (eval . (set (make-local-variable 'uikit-gsl-additions-root)
                  (expand-file-name "UIKitGSLAdditions" project-dir))))))

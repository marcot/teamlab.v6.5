﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3615
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ASC.Web.Studio.Core.Notify {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class WebPatternResource {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal WebPatternResource() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("ASC.Web.Studio.Core.Notify.WebPatternResource", typeof(WebPatternResource).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to &lt;pt:catalog xmlns:pt=&quot;urn:asc.notify.pattern.xsd&quot;&gt;
        ///  &lt;block contentType=&quot;html&quot;&gt;
        ///    &lt;formatter type=&quot;ASC.Notify.Patterns.NVelocityPatternFormatter, ASC.Common&quot; /&gt;
        ///    &lt;patterns&gt;
        ///      &lt;!--new password--&gt;
        ///      &lt;pattern id=&quot;change_pwd&quot; name=&quot;new password&quot;&gt;
        ///        &lt;subject resource=&quot;|subject_change_pwd|ASC.Web.Studio.Core.Notify.WebstudioPatternResource,ASC.Web.Studio&quot;&gt;&lt;/subject&gt;
        ///        &lt;body styler=&quot;ASC.Notify.Textile.TextileStyler,ASC.Notify.Textile&quot; resource=&quot;|pattern_change_pwd|ASC.Web.Studio.Cor [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string webstudio_patterns {
            get {
                return ResourceManager.GetString("webstudio_patterns", resourceCulture);
            }
        }
    }
}

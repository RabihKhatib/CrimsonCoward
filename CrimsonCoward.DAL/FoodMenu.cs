//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrimsonCoward.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class FoodMenu
    {
        public System.Guid Id { get; set; }
        public string Description { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public System.Guid CategoryID { get; set; }
        public Nullable<decimal> MENU_ORDER { get; set; }
    
        public virtual FoodCategory FoodCategory { get; set; }
    }
}

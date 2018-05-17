using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using HuduMovie.Models;

namespace HuduMovie.Controllers
{
    public class rolesController : ApiController
    {
        private huduEntities db = new huduEntities();

        // GET: api/roles
        public IQueryable<role> Getroles()
        {
            return db.roles;
        }

        // GET: api/roles/5
        [ResponseType(typeof(role))]
        public async Task<IHttpActionResult> Getrole(int id)
        {
            role role = await db.roles.FindAsync(id);
            if (role == null)
            {
                return NotFound();
            }

            return Ok(role);
        }

        // PUT: api/roles/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putrole(int id, role role)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != role.role_id)
            {
                return BadRequest();
            }

            db.Entry(role).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!roleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/roles
        [ResponseType(typeof(role))]
        public async Task<IHttpActionResult> Postrole(role role)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.roles.Add(role);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = role.role_id }, role);
        }

        // DELETE: api/roles/5
        [ResponseType(typeof(role))]
        public async Task<IHttpActionResult> Deleterole(int id)
        {
            role role = await db.roles.FindAsync(id);
            if (role == null)
            {
                return NotFound();
            }

            db.roles.Remove(role);
            await db.SaveChangesAsync();

            return Ok(role);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool roleExists(int id)
        {
            return db.roles.Count(e => e.role_id == id) > 0;
        }
    }
}
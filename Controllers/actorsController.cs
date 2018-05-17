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
    public class actorsController : ApiController
    {
        private huduEntities db = new huduEntities();

        // GET: api/actors
        public IQueryable<actor> Getactors()
        {
            return db.actors;
        }

        // GET: api/actors/5
        [ResponseType(typeof(actor))]
        public async Task<IHttpActionResult> Getactor(int id)
        {
            actor actor = await db.actors.FindAsync(id);
            if (actor == null)
            {
                return NotFound();
            }

            return Ok(actor);
        }

        // PUT: api/actors/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putactor(int id, actor actor)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != actor.actor_id)
            {
                return BadRequest();
            }

            db.Entry(actor).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!actorExists(id))
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

        // POST: api/actors
        [ResponseType(typeof(actor))]
        public async Task<IHttpActionResult> Postactor(actor actor)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.actors.Add(actor);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = actor.actor_id }, actor);
        }

        // DELETE: api/actors/5
        [ResponseType(typeof(actor))]
        public async Task<IHttpActionResult> Deleteactor(int id)
        {
            actor actor = await db.actors.FindAsync(id);
            if (actor == null)
            {
                return NotFound();
            }

            db.actors.Remove(actor);
            await db.SaveChangesAsync();

            return Ok(actor);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool actorExists(int id)
        {
            return db.actors.Count(e => e.actor_id == id) > 0;
        }
    }
}
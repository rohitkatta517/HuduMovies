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
    public class user_movieController : ApiController
    {
        private huduEntities db = new huduEntities();

        // GET: api/user_movie
        public IQueryable<user_movie> Getuser_movie()
        {
            return db.user_movie;
        }

        // GET: api/user_movie/5
        [ResponseType(typeof(user_movie))]
        public async Task<IHttpActionResult> Getuser_movie(int id)
        {
            user_movie user_movie = await db.user_movie.FindAsync(id);
            if (user_movie == null)
            {
                return NotFound();
            }

            return Ok(user_movie);
        }

        // PUT: api/user_movie/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putuser_movie(int id, user_movie user_movie)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != user_movie.user_movies_id)
            {
                return BadRequest();
            }

            db.Entry(user_movie).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!user_movieExists(id))
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

        // POST: api/user_movie
        [ResponseType(typeof(user_movie))]
        public async Task<IHttpActionResult> Postuser_movie(user_movie user_movie)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.user_movie.Add(user_movie);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = user_movie.user_movies_id }, user_movie);
        }

        // DELETE: api/user_movie/5
        [ResponseType(typeof(user_movie))]
        public async Task<IHttpActionResult> Deleteuser_movie(int id)
        {
            user_movie user_movie = await db.user_movie.FindAsync(id);
            if (user_movie == null)
            {
                return NotFound();
            }

            db.user_movie.Remove(user_movie);
            await db.SaveChangesAsync();

            return Ok(user_movie);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool user_movieExists(int id)
        {
            return db.user_movie.Count(e => e.user_movies_id == id) > 0;
        }
    }
}